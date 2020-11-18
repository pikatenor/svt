import client from '@/api/client'

export async function getMessage() {
  const response = await client.get('/api/hello');
  return response.data.message;
}
