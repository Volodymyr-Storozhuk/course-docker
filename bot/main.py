from aiogram import executor
# for run as module
from bot.src.echobot import dp
# for run as script
# from src.echobot import dp


if __name__ == "__main__":
    executor.start_polling(dp, skip_updates=True)
