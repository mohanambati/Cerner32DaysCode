;;;; cerner_2^5_2018

(ns cryptocurrencyapi.handler
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]])
  (:require [clojure.data.json :as json])
  (:import (org.jsoup Jsoup)))

(def URL "https://coinmarketcap.com/currencies/bitcoin/")
(def html (.get (Jsoup/connect URL)))

(defroutes app-routes
  (GET "/bitcoin" [] (json/write-str {:status 200 
			   :body {:value (read-string (first (vec (.split (.text (.select html "span[data-currency-value]")) " "))))}}))
  (route/not-found "Not Found"))

(def app
  (wrap-defaults app-routes site-defaults))
