from aiogram import executor
# for run as module
from src.echobot import dp
# for run as script
# from src.echobot import dp
from src.database.create_table import execute_query, create_message_table


if __name__ == "__main__":
    execute_query(create_message_table)
    executor.start_polling(dp, skip_updates=True)
