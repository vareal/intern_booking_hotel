import Home from '../components/Home'
import RoomDetail from '../components/room/RoomDetail'
import BookingRoom from '../components/booking/BookingRoom'
import Profile from '../components/layouts/Profile'
import OrderHistory from '../components/orders/OrderHistory'
import Coin from '../components/payment/Coin'

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
  },
  {
    path: '/me',
    component: Profile,

    children: [
      {
        path: ':id/order-history',
        name: 'OrderHistory',
        component: OrderHistory
      },
      {
        path: ':id/giftcards',
        name: 'Coin',
        component: Coin
    }]
  }
]
