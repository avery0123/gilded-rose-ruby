RSpec.describe GildedRose do
  describe "#tick" do
    context "Normal Item" do
      context "before sell date" do
        it "reduces the days remaining and quality" do
          gilded_rose = GildedRose.new(name: "Normal Item", days_remaining: 5, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 9)
        end
      end

      context "on sell date" do
        it "reduces the days remaining more and quality twice as fast" do
          gilded_rose = GildedRose.new(name: "Normal Item", days_remaining: 0, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -1, quality: 8)
        end
      end

      context "after sell date" do
        it "reduces quality twice as fast" do
          gilded_rose = GildedRose.new(name: "Normal Item", days_remaining: -10, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -11, quality: 8)
        end
      end

      context "of zero quality" do
        it "does not reduce quality" do
          gilded_rose = GildedRose.new(name: "Normal Item", days_remaining: 5, quality: 0)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 0)
        end
      end
    end

    context "Aged Brie" do
      context "before sell date" do
        it "increases quality and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Aged Brie", days_remaining: 5, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 11)
        end
      end

      context "on sell date" do
        it "increases quality by 2 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Aged Brie", days_remaining: 0, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -1, quality: 12)
        end
      end

      context "after sell date" do
        it "increases quality by 2 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Aged Brie", days_remaining: -10, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -11, quality: 12)
        end
      end
    end

    context "Sulfuras" do
      context "before sell date" do
        it "does not change days remaining or quality" do
          gilded_rose = GildedRose.new(name: "Sulfuras, Hand of Ragnaros", days_remaining: 5, quality: 80)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 5, quality: 80)
        end
      end

      context "on sell date" do
        it "does not change days remaining or quality" do
          gilded_rose = GildedRose.new(name: "Sulfuras, Hand of Ragnaros", days_remaining: 0, quality: 80)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 0, quality: 80)
        end
      end

      context "after sell date" do
        it "does not change days remaining or quality" do
          gilded_rose = GildedRose.new(name: "Sulfuras, Hand of Ragnaros", days_remaining: -10, quality: 80)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -10, quality: 80)
        end
      end
    end

    context "Backstage Pass" do
      context "long before sell date (more than 10 days)" do
        it "increases quality by 1 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 11, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 10, quality: 11)
        end
      end

      context "medium close to sell date (6 to 10 days)" do
        it "increases quality by 2 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 10, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 9, quality: 12)
        end
      end

      context "very close to sell date (5 days or less)" do
        it "increases quality by 3 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 5, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 13)
        end
      end

      context "on sell date" do
        it "drops quality to 0" do
          gilded_rose = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 0, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -1, quality: 0)
        end
      end

      context "after sell date" do
        it "drops quality to 0" do
          gilded_rose = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: -10, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -11, quality: 0)
        end
      end
    end

    context "Conjured Mana" do
      context "before sell date" do
        it "reduces quality by 2 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Conjured Mana Cake", days_remaining: 5, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: 4, quality: 8)
        end
      end

      context "on sell date" do
        it "reduces quality by 4 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Conjured Mana Cake", days_remaining: 0, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -1, quality: 6)
        end
      end

      context "after sell date" do
        it "reduces quality by 4 and reduces days remaining" do
          gilded_rose = GildedRose.new(name: "Conjured Mana Cake", days_remaining: -10, quality: 10)
          gilded_rose.tick
          expect(gilded_rose).to have_attributes(days_remaining: -11, quality: 6)
        end
      end
    end
  end
end
