#!/bin/zsh

set -euo pipefail

course_id=2533568
section_number="${1:-3}"
output_root="$(pwd)/notes/udemy"

chrome_js() {
  local tmpdir
  local result
  tmpdir="$(mktemp -d)"
  cat > "$tmpdir/script.js"
  result="$(
    osascript \
    -e 'on run argv' \
    -e 'set jsPath to item 1 of argv' \
    -e 'set js to read (POSIX file jsPath)' \
    -e 'tell application "Google Chrome"' \
    -e 'return execute active tab of front window javascript js' \
    -e 'end tell' \
    -e 'end run' \
    "$tmpdir/script.js"
  )"
  rm -rf "$tmpdir"
  printf '%s\n' "$result"
}

browser_xhr() {
  local url_json
  url_json="$(jq -Rn --arg url "$1" '$url')"
  chrome_js <<EOF
(function(){try{var x=new XMLHttpRequest();x.open("GET", ${url_json}, false);x.withCredentials=true;x.send(null);return x.responseText;}catch(e){return JSON.stringify({error:String(e)});}})()
EOF
}

clean_vtt() {
  perl -0pe '
    s/\r//g;
    s/^WEBVTT\s*//;
    s/^\d+\n//mg;
    s/^\d{2}:\d{2}:\d{2}\.\d{3}\s+-->\s+\d{2}:\d{2}:\d{2}\.\d{3}\n//mg;
    s/<[^>]+>//g;
    s/&nbsp;/ /g;
    s/&amp;/&/g;
    s/&lt;/</g;
    s/&gt;/>/g;
  ' | awk '
    NF {
      gsub(/[[:space:]]+/, " ");
      if ($0 != prev) {
        out = out (out ? " " : "") $0;
        prev = $0;
      }
    }
    END { print out }
  '
}

slugify() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/&/ and /g; s/[^a-z0-9]+/-/g; s/^-+|-+$//g; s/-+/-/g'
}

mkdir -p "$output_root/raw"

curriculum_json="$(browser_xhr "/api-2.0/courses/${course_id}/subscriber-curriculum-items/?page_size=400&fields[chapter]=title,object_index&fields[lecture]=title,object_index,asset")"

section_data="$(jq -c --argjson sec "$section_number" '
  reduce .results[] as $item (
    {collect:false, done:false, title:null, lectures:[]};
    if .done then .
    elif $item._class == "chapter" and $item.object_index == $sec then
      .collect = true | .title = $item.title
    elif .collect and $item._class == "chapter" then
      .done = true
    elif .collect and $item._class == "lecture" then
      .lectures += [{
        id: $item.id,
        objectIndex: $item.object_index,
        title: $item.title,
        assetType: ($item.asset.asset_type // "Unknown")
      }]
    else .
    end
  )
' <<<"$curriculum_json")"

section_title="$(jq -r '.title' <<<"$section_data")"
if [[ -z "$section_title" || "$section_title" == "null" ]]; then
  echo "Could not find section ${section_number}" >&2
  exit 1
fi

section_slug="$(slugify "section-${section_number}-${section_title}")"
transcript_md_path="$output_root/raw/${section_slug}-transcript.md"

{
  printf '# Section %s: %s\n\n' "$section_number" "$section_title"
} > "$transcript_md_path"

while IFS=$'\t' read -r lecture_id lecture_index lecture_title lecture_asset_type; do
  {
    printf '## %s. %s\n\n' "$lecture_index" "$lecture_title"
    printf -- '- Lecture ID: %s\n' "$lecture_id"
    printf -- '- Asset type: %s\n' "$lecture_asset_type"
  } >> "$transcript_md_path"

  if [[ "$lecture_asset_type" != "Video" ]]; then
    {
      printf '\n_No transcript extracted for this non-video lecture._\n\n'
    } >> "$transcript_md_path"
    continue
  fi

  detail_json="$(browser_xhr "/api-2.0/users/me/subscribed-courses/${course_id}/lectures/${lecture_id}/?fields[lecture]=asset&fields[asset]=asset_type,length,captions")"
  duration="$(jq -r '.asset.length // empty' <<<"$detail_json")"
  caption_url="$(jq -r '
    (
      [.asset.captions[]? | select((.locale_id == "en_US") or (.locale_id == "en_GB") or ((.video_label // "") | test("English"; "i"))) | select(.source == "manual")] +
      [.asset.captions[]? | select((.locale_id == "en_US") or (.locale_id == "en_GB") or ((.video_label // "") | test("English"; "i")))] +
      [.asset.captions[]? | select(.source == "manual")] +
      [.asset.captions[]?]
    )[0].url // empty
  ' <<<"$detail_json")"

  if [[ -n "$duration" ]]; then
    printf -- '- Duration (seconds): %s\n' "$duration" >> "$transcript_md_path"
  fi

  if [[ -z "$caption_url" ]]; then
    {
      printf '\n_No caption URL found for this lecture._\n\n'
    } >> "$transcript_md_path"
    continue
  fi

  transcript_text="$(curl -fsSL "$caption_url" | clean_vtt)"
  {
    printf '\n%s\n\n' "${transcript_text:-_Transcript came back empty._}"
  } >> "$transcript_md_path"
done < <(jq -r '.lectures[] | [.id, .objectIndex, .title, .assetType] | @tsv' <<<"$section_data")

printf '%s\n' "$transcript_md_path"
