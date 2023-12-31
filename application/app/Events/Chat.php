<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class Chat  implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Create a new event instance.
     */

     public $message;
     public $attachment;
     public $receiverId;
     public $senderId;
     public $createdAt;

    public function __construct($data)
    {
        $this->message = $data->message;
        $this->attachment = $data->attachment;
        $this->receiverId = $data->receiverId;
        $this->senderId = $data->senderId;
        $this->createdAt = $data->createdAt;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return array<int, \Illuminate\Broadcasting\Channel>
     */

        public function broadcastOn(): array
        {
            return [
                new Channel('chat-channel'),
            ];
        }
        public function broadcastAs()
        {
            return $this->receiverId;
        }
    }

