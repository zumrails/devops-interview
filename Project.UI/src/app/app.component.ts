import { Component, OnInit } from '@angular/core';
import { ApiService } from './api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  apiResponse: any;
  ledColor: string = 'red';
  message: string = '';

  constructor(private apiService: ApiService) { }

  ngOnInit(): void {
    this.checkApiResponse();
  }

  checkApiResponse() {
    this.apiService.fetchData().subscribe(
      (response) => {
        this.apiResponse = response;
        this.ledColor = 'green';
        this.message = 'Good job, the API is connected :)';
        this.apiResponse.dateTime = new Date(this.apiResponse.dateTime).toLocaleString(undefined, {timeZone: 'UTC'});
      },
      (error) => {
        console.error(error);
        this.ledColor = 'red';
        this.message = 'Too bad, there\'s no response for the API :(';
      }
    );
  }
}