import { loadRemoteModule } from '@angular-architects/module-federation';
import { Component, OnInit, ViewChild, ViewContainerRef } from '@angular/core';
import { SharedLibService } from 'shared-lib';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'shell';

  @ViewChild('placeHolder', { read: ViewContainerRef })
  viewContainer!: ViewContainerRef;

  constructor(private service: SharedLibService) {
    service.name = 'mfe';
  }

  ngOnInit(): void {
    this.load();
  }

  async load(): Promise<void> {

    const m = await loadRemoteModule({
      type: 'manifest',
      remoteName: 'home',
      exposedModule: './Component'
    });

    const ref = this.viewContainer.createComponent(m.AppComponent);
    // const compInstance = ref.instance;
}
}
