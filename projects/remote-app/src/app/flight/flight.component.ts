import { Component } from '@angular/core';
import { SharedLibService } from 'shared-lib';

@Component({
  selector: 'app-flight',
  templateUrl: './flight.component.html',
  styleUrls: ['./flight.component.scss']
})
export class FlightComponent {

  constructor(public service: SharedLibService) {
  }
}
