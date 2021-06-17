import Home from '../components/Home'
import RoomDetail from '../components/room/RoomDetail'
import BookingRoom from '../components/booking/BookingRoom'

export const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/rooms/:id',
    name: 'RoomDetail',
    component: RoomDetail
  },
  {
    path: '/rooms/:id/booking-room',
    name: 'BookingRoom',
    component: BookingRoom
  }
]
