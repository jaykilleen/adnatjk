import Axios from 'axios';
import React, { useEffect, useState } from 'react';

const Shift = () => {
    const [shift, setShift] = useState({ loading: true, data: [] });
    const [author, setAuthor] = useState("");
    const { id } = useParams();

    useEffect(() => {
        const url = urlHost + "posts/" + id;
        Axios.get(url)
            .then(res => {
                if (res.data.status) {
                    setShift({ loading: false, data: res.data.data });
                    const authorUrl = urlHost + "user/name?id=" + res.data.data.user_id;
                    Axios.get(authorUrl)
                        .then((res) => {
                            if (res.status === 200) {
                                setAuthor(res.data.name);
                            }
                        })
                        .catch(error => {
                            setUserName("Could not load");
                        })
                }
            })
            .catch(error => {
                console.log(error);
                setShift({ loading: false, data: [] });
            })
    }, [])

    const { loading, data } = shift;
    return (
        <div className="container mx-auto max-w-3xl px-6 py-4 my-10 rounded border-gray-300 border shadow bg-gray-100">
            {loading ?
                "Loading..."
                :
                data.status !== "approved" ?
                    <p>Not approved yet! Sorry, this shift is not yet approved to be published. Try again later!</p>
                    :
                    <div className="">
                        <h1 className="text-2xl">{data.title}</h1>
                        <p className="text-sm font-light text-gray-600">
                            <Link to={`/profile/${id}`}
                                className="hover:underline">{author} </Link>
                            | Last updated: {moment(data.updated_at).format(DATE_FORMAT)}{" "}
                            | <span className="relative mt-2 p-1 bg-gray-200 border border-gray-300 rounded" >{data.category}</span>
                        </p>
                        <img src="https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg"
                            alt={`Illustrative image of ${data.title}`}
                            className="mt-4 max-w-full h-64" />
                        <p className="mt-4">
                            {data.content}
                        </p>
                    </div>
            }
        </div>
    );
}

export default Shifts;
