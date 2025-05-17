import { Component, Input, OnInit } from '@angular/core';
import { ShareModule } from '../share/share.module';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [ShareModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css',
})
export class HeaderComponent implements OnInit {
  @Input() drawer: any 
  
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }
  

}
