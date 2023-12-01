import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="download-redirect"
export default class extends Controller {

  redirect() {
    fetch('<%= download_csv_search_path(@search) %>', {
      method: 'GET',
    })
    .then(response => {
      if (response.ok) {
        window.location.href = '<%= root_path () %>';
      }
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }

}
