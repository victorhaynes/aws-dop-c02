# Udemy DOP-C02 Notes

## Summaries

- [Section 3 Summary](./section-3-domain-1-sdlc-automation-summary.md)
- [Section 4 Summary](./section-4-domain-2-configuration-management-and-iac-summary.md)
- [Section 5 Summary](./section-5-domain-3-resilient-cloud-solutions-summary.md)
- [Section 6 Summary](./section-6-domain-4-monitoring-and-logging-summary.md)
- [Section 7 Summary](./section-7-domain-5-incident-and-event-response-summary.md)
- [Section 8 Summary](./section-8-domain-6-security-and-compliance-summary.md)
- [Section 9 Summary](./section-9-other-services-summary.md)
- [Section 10 Summary](./section-10-course-wrap-up-summary.md)

## Raw Transcripts

- [Section 3 Transcript](./raw/section-3-domain-1-sdlc-automation-transcript.md)
- [Section 4 Transcript](./raw/section-4-domain-2-configuration-management-and-iac-transcript.md)
- [Section 5 Transcript](./raw/section-5-domain-3-resilient-cloud-solutions-transcript.md)
- [Section 6 Transcript](./raw/section-6-domain-4-monitoring-and-logging-transcript.md)
- [Section 7 Transcript](./raw/section-7-domain-5-incident-and-event-response-transcript.md)
- [Section 8 Transcript](./raw/section-8-domain-6-security-and-compliance-transcript.md)
- [Section 9 Transcript](./raw/section-9-other-services-transcript.md)
- [Section 10 Transcript](./raw/section-10-course-wrap-up-transcript.md)

## Extractor

- [extract_udemy_section.sh](../../scripts/extract_udemy_section.sh)

The extractor reads from the active logged-in Udemy tab in Chrome, pulls the section lecture list from Udemy's internal API, fetches the English caption files, and writes cleaned markdown transcripts into `notes/udemy/raw/`.
