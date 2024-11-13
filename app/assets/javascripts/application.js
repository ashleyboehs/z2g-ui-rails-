document.addEventListener("DOMContentLoaded", function() {
  function handlePipelineCheckbox(checkbox) {
    const pipelineRow = checkbox.closest('tr');
    const contentRow = pipelineRow.nextElementSibling;
    const issueCheckboxes = contentRow.querySelectorAll('.issue-checkbox');
  }

  function updatePipelineCheckboxState(pipelineId) { /*...*/ }
  function updatePipelineIssueCounts() { /*...*/ }
  function toggleUnselectedIssues() { /*...*/ }
  function hideUncheckedIssueWithDelay(issueRow) { /*...*/ }
  function toggleAccordion(id) { /*...*/ }
});
