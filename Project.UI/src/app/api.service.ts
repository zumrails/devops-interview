import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  constructor(private http: HttpClient) { }
  private baseApiUrl = environment.apiUrl;

  fetchData() {
    const apiUrl = `${this.baseApiUrl}/date`;
    return this.http.get(apiUrl);
  }
}